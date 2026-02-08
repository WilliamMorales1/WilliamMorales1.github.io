// Global variables
let projection, context, canvas, worldData, dbData, render;
let isPaused = false;
let hoveredCountry = null;
let rotationValue = [0, 0]; // [longitude, latitude]
const speedFactor = 0.15;   // Increased speed for visibility

document.addEventListener('DOMContentLoaded', () => {
    initGlobe();
    updateGlobeSize();
});

window.addEventListener('resize', () => {
    updateGlobeSize();
});

function updateGlobeSize() {
    const container = document.querySelector(".map-container");
    if (!container || !projection || !canvas) return;

    const width = container.clientWidth;
    const height = container.clientHeight;
    const dpi = window.devicePixelRatio || 1;

    // 1. Update Canvas size
    canvas.width = width * dpi;
    canvas.height = height * dpi;
    canvas.style.width = width + "px";
    canvas.style.height = height + "px";

    context = canvas.getContext("2d");
    context.scale(dpi, dpi);

    // 2. Update Projection - IMPORTANT: Use a larger multiplier for a bigger globe
    const newScale = Math.min(width, height) * 0.45; 
    projection
        .scale(newScale)
        .translate([width / 2, height / 2]);

    // If you don't do this, the math stays small
    path = d3.geoPath().projection(projection).context(context);

    if (render) render();
}

function initGlobe() {
    const container = document.querySelector(".map-container");
    const tooltip = d3.select("#tooltip");
    const width = container.offsetWidth;
    const height = container.offsetHeight;

    d3.select("#world-map").selectAll("*").remove();
    canvas = d3.select("#world-map")
        .append("canvas")
        .attr("width", width)
        .attr("height", height)
        .node();
    
    context = canvas.getContext("2d");

    projection = d3.geoOrthographic()
        .scale(Math.min(width, height) * 0.7)
        .translate([width / 2, height / 2])
        .clipAngle(90);

    const path = d3.geoPath().projection(projection).context(context);

    Promise.all([
        d3.json("https://cdn.jsdelivr.net/npm/world-atlas@2/countries-110m.json"),
        d3.json("country-languages.json") 
    ]).then(function(data) {
        const world = data[0];
        dbData = data[1]; // Store in global
        const countries = topojson.feature(world, world.objects.countries).features;

        // --- Legend & Color Logic ---
        const allFamilyNames = Object.values(dbData.families || {});
        const topFamilies = allFamilyNames.slice(0, 10);
        const colorScale = d3.scaleOrdinal()
            .domain([...topFamilies, "Other"])
            .range(d3.schemeTableau10.concat(["#7f7f7f"]));

        const getCountryColor = (d) => {
            const countryInfo = dbData.countries[d.properties.name];
            let baseColor = "#fff"; // Default
            if (countryInfo && countryInfo.families?.length > 0) {
                const primaryFamily = countryInfo.families[0];
                return topFamilies.includes(primaryFamily) ? colorScale(primaryFamily) : colorScale("Other");
            }
            const isLightMode = !document.body.classList.contains('dark-mode');
            return isLightMode ? d3.color(baseColor).brighter(0.5).toString() : baseColor;
        };

        // Populate Legend
        const legendContainer = d3.select("#legend");
        if (!legendContainer.empty()) {
            legendContainer.html("<strong>Language Families</strong><br><br>");
            colorScale.domain().forEach(family => {
                const item = legendContainer.append("div").attr("class", "legend-item");
                item.append("div").attr("class", "color-box").style("background-color", colorScale(family));
                item.append("span").text(family);
            });
        }

        // Define Global Render function
        render = function() {
            context.clearRect(0, 0, width, height);

            const isLightMode = !document.body.classList.contains('dark-mode');

            // Adjust water and stroke colors
            const waterColor = isLightMode ? d3.color("#242f3e").brighter(3).toString() : "#242f3e";
            const strokeColor = isLightMode ? d3.color("#4b5563").brighter(1.5).toString() : "#4b5563";
            const countryBorder = isLightMode ? "#888" : "#242f3e";

            // Water
            context.beginPath();
            path({type: "Sphere"});
            context.fillStyle = waterColor;
            context.fill();
            context.strokeStyle = strokeColor;
            context.stroke();

            // Countries
            countries.forEach(d => {
                context.beginPath();
                path(d);
                let color = getCountryColor(d);
                
                if (hoveredCountry && hoveredCountry.properties.name === d.properties.name) {
                    color = d3.color(color).brighter(0.7);
                }
                
                context.fillStyle = color;
                context.fill();
                context.strokeStyle = countryBorder;
                context.lineWidth = 0.5;
                context.stroke();
            });
        };

        // --- Drag functionality ---
        const drag = d3.drag()
            .on("start", (event) => {
                const rect = canvas.getBoundingClientRect();
                const x = event.x; // d3.drag provides relative x
                const y = event.y; // d3.drag provides relative y

                const inverted = projection.invert([x, y]);
                const isOverCountry = inverted && countries.find(c => d3.geoContains(c, inverted));

                if (isOverCountry) {
                    canvas.style.cursor = "pointer"; // "Clicked" version for countries
                } else {
                    canvas.style.cursor = "grabbing"; // Or "grabbing" if you want drag feedback everywhere
                }
                
                isPaused = true;
            })
            .on("drag", (event) => {
                const rotate = projection.rotate();
                const k = 75 / projection.scale();
                projection.rotate([
                    rotate[0] + event.dx * k,
                    rotate[1] - event.dy * k
                ]);
                rotationValue = projection.rotate();
                render();
            })
            .on("end", (event) => {
                isPaused = false;
                
                // Return to the appropriate hover state
                const rect = canvas.getBoundingClientRect();
                const x = event.x;
                const y = event.y;
                const inverted = projection.invert([x, y]);
                const isOverCountry = inverted && countries.find(c => d3.geoContains(c, inverted));

                canvas.style.cursor = isOverCountry ? "pointer" : "grab";
            });

        d3.select(canvas).call(drag).style("cursor", "grab");

        // --- Hover functionality ---
        canvas.addEventListener("mousemove", (event) => {
            const rect = canvas.getBoundingClientRect();
            const x = event.clientX - rect.left;
            const y = event.clientY - rect.top;

            // HIT TEST: Calculate distance from center of the sphere
            const center = projection.translate();
            const radius = projection.scale();
            const dx = x - center[0];
            const dy = y - center[1];
            const distance = Math.sqrt(dx * dx + dy * dy);

            // 1. Check if mouse is outside the globe's radius
            if (distance > radius) {
                canvas.style.cursor = "default"; // Return to normal pointer
                isPaused = false;
                hoveredCountry = null;
                tooltip.style("opacity", 0);
                render();
                return;
            }

            // 2. If we reach here, we are OVER the globe
            canvas.style.cursor = "grab"; // Change to grab only when over the sphere

            const inverted = projection.invert([x, y]);
            const found = (inverted && Math.abs(inverted[0]) <= 180) 
                ? countries.find(c => d3.geoContains(c, inverted)) 
                : null;

            if (found) {
                isPaused = true;
                hoveredCountry = found;
                canvas.style.cursor = "pointer";

                // Get language info from dbData
                const countryName = found.properties.name;
                const countryInfo = dbData.countries[countryName]; // Use global dbData
                
                let tooltipContent = `<strong style="color: white;">${countryName}</strong>`;
                if (countryInfo && countryInfo.families) {
                    tooltipContent += `<br>Families: ${countryInfo.families.join(", ")}`;
                    tooltipContent += `<br>Languages: ${countryInfo.langs.join(", ")}`;
                }

                tooltip.style("opacity", 1)
                    .style("left", (event.pageX + 15) + "px")
                    .style("top", (event.pageY - 40) + "px")
                    .html(tooltipContent);
            } else {
                isPaused = false;
                hoveredCountry = null;
                
                // Revert to grab icon when over ocean/water
                canvas.style.cursor = "grab"; 

                tooltip.style("opacity", 0);
            }
            render();
        });

        // --- Auto-Rotation Timer ---
        d3.timer(() => {
            if (!isPaused && render) {
                rotationValue[0] += speedFactor;
                projection.rotate(rotationValue);
                render();
            }
        });

        let resizeTimeout;
        window.addEventListener('resize', () => {
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(() => {
                updateGlobeSize();
            }, 100); // 100ms delay to let CSS animations finish
        });
    });
}