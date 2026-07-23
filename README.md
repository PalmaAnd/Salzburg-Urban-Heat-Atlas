# 🌳 Salzburg Urban Heat Atlas

> An open-source platform for understanding, visualizing and reducing urban heat in Salzburg through scientific data analysis, GIS, and interactive mapping.

---

## Overview

The **Salzburg Urban Heat Atlas** aims to provide citizens, researchers, urban planners and policymakers with a comprehensive understanding of how heat is distributed across Salzburg.

Urban heat is one of the fastest growing climate-related challenges in Europe. As cities become denser and heatwaves become more frequent and intense, public spaces that were once comfortable can become hazardous—especially for vulnerable populations such as children, older adults and people with chronic illnesses.

Despite the growing importance of urban climate adaptation, detailed and accessible information about local heat conditions often remains fragmented across scientific publications, government datasets and technical GIS software.

This project seeks to bridge that gap.

By combining satellite imagery, weather observations, geospatial analysis and open data, the Salzburg Urban Heat Atlas will visualize the city's thermal landscape and help identify where interventions such as tree planting, green infrastructure or street redesign could have the greatest impact.

---

## Vision

Imagine opening a map of Salzburg and instantly seeing:

- which streets become dangerously hot during summer afternoons
- where trees provide meaningful cooling
- how comfortable it is to walk through different neighborhoods
- where future trees should be planted
- which routes stay coolest during a heatwave

Instead of relying on intuition, decisions can be supported by scientific evidence and transparent data.

The long-term vision is to create an open digital platform that encourages climate-resilient urban planning while remaining understandable for everyone—not just GIS experts.

---

## Why this project exists

Climate change is no longer a future problem.

Across Europe:

- Heatwaves are becoming more frequent.
- Urban Heat Islands increase temperatures by several degrees.
- Heat-related mortality is rising.
- Public spaces are often designed around cars rather than people.
- Many cities lack detailed public heat information.

Although Salzburg is already greener than many European cities, there is significant potential for improvement through data-driven planning.

This project aims to make that information openly available.

---

## Project Goals

### Scientific

- Visualize urban heat distribution
- Study spatial relationships between vegetation and cooling
- Analyze urban morphology
- Investigate heat mitigation strategies
- Support evidence-based climate adaptation

### Technical

- Build an interactive GIS platform
- Process multiple geospatial datasets
- Develop reproducible data pipelines
- Provide an open API
- Maintain modular architecture

### Societal

- Increase public awareness
- Support city planners
- Help citizens avoid extreme heat
- Encourage greener urban development
- Promote sustainable mobility

---

## Planned Features

### Phase 1

- Interactive city map
- Building layer
- Roads
- Parks
- Water
- Tree coverage

### Phase 2

- Surface temperature visualization
- Heat index calculation
- Time-based heat visualization

### Phase 3

- Shade analysis
- Tree canopy estimation
- Solar exposure
- Green coverage

### Phase 4

- Street heat scores
- Neighborhood statistics
- Hotspot detection
- Cooling hotspot detection

### Phase 5

- Walking comfort
- Cool route planning
- AI-generated recommendations

### Future

- Flood risk
- Noise pollution
- Air quality
- Biodiversity
- Urban Digital Twin
- Machine learning predictions

---

## Scientific Foundation

The project combines concepts from multiple scientific disciplines:

- Urban climatology
- Geographic Information Systems (GIS)
- Remote sensing
- Environmental science
- Meteorology
- Data science
- Urban planning

Wherever possible, algorithms will be based on peer-reviewed research rather than arbitrary scoring methods.

Scientific assumptions and references will be documented in the Wiki.

---

## Technology Stack

The exact stack may evolve over time.

Current direction:

Frontend

- React
- TypeScript
- Leaflet / MapLibre

Backend

- Python
- FastAPI

Spatial Database

- PostgreSQL
- PostGIS

Geospatial

- GeoPandas
- Rasterio
- GDAL
- Shapely

Data Processing

- NumPy
- Pandas

Visualization

- MapLibre
- Leaflet
- D3 (future)

---

## Data Sources

The following publicly available sources can support the first project phases:

| Source | Data type | Potential use in this project |
|---|---|---|
| OpenStreetMap | Buildings, roads, land use, water, points of interest | Base map layers, urban morphology indicators, walkability context |
| Copernicus Sentinel-2 (L2A) | Multispectral satellite imagery (10–20m) | NDVI/vegetation, surface material proxies, seasonal change detection |
| Copernicus Sentinel-3 (LST products) | Land Surface Temperature products | Regional temperature context and hotspot screening |
| Copernicus Land Monitoring Service (CLMS) | Imperviousness, tree cover density, land cover products | Urban heat driver analysis (sealed surfaces vs. vegetation) |
| Salzburg Open Data (city/state portals) | Tree cadastre, green spaces, water features, planning layers (where available) | Local high-resolution urban context and intervention planning |
| data.gv.at (Austrian open data) | National geodata catalogs, administrative and environmental layers | Additional Austrian reference layers and metadata discovery |
| Open-Meteo / DWD open weather APIs | Historical and forecast meteorological time series | Air temperature and humidity context for heat index interpretation |
| GeoSphere Austria (ZAMG) open resources | Austrian meteorological and climate datasets | Ground-truth weather observations and climate baselines |

Selection criteria for ingestion:

- Salzburg or Austria-wide coverage with usable local resolution
- Open and reusable licensing
- Stable update cadence and documented metadata
- Prefer machine-readable formats (GeoJSON, CSV, COG/GeoTIFF, NetCDF, API)

Each dataset will remain under its original license.
The project does **not** claim ownership of external datasets.

### Suggested dataset additions (high-value)

- **EU-DEM / Copernicus DEM**: elevation and slope context for airflow and cold-air drainage patterns.
- **CORINE / Urban Atlas land cover**: standardized land-cover classes for cross-district comparisons.
- **High-resolution orthoimagery (where open)**: visual validation of tree canopy and sealed surfaces.
- **Salzburg zoning and planning layers (where available)**: feasibility context for mitigation actions.
- **Public transport and mobility data (GTFS, cycling network)**: supports heat-aware routing and access analysis.

### Proposed API endpoints (MVP-oriented)

The project can start with a small, stable read API and expand by phase:

| Endpoint | Purpose | Phase |
|---|---|---|
| `GET /api/v1/health` | Service status check | 1 |
| `GET /api/v1/layers` | List available map layers and metadata | 1 |
| `GET /api/v1/layers/{layer_id}` | Layer details (source, timestamp, license, schema) | 1 |
| `GET /api/v1/map/tiles/{layer}/{z}/{x}/{y}` | Tile delivery for map visualization | 1 |
| `GET /api/v1/heat/hotspots?bbox=...` | Heat hotspot polygons/points within area | 2 |
| `GET /api/v1/heat/timeseries?lat=...&lon=...` | Time-based heat and weather profile at location | 2 |
| `GET /api/v1/neighborhoods/{id}/stats` | Aggregated district indicators (heat, green, sealed area) | 4 |
| `POST /api/v1/routes/coolest` | Heat-aware route between two points | 5 |
| `GET /api/v1/methodology` | Scoring and model assumptions for transparency | 2 |

### Quick feasibility analysis (based on currently identified data)

**Overall doability: high for an MVP, medium for advanced analytics.**

**Why MVP is feasible now**
- Core geometry and context layers are already available from OSM and Austrian/Salzburg open data portals.
- Public weather APIs and Copernicus products provide enough temporal and thermal context for first heat maps.
- Planned stack (FastAPI + PostGIS + Geo stack) is appropriate for this data type and scale.

**Main constraints**
- Spatial resolution mismatch (e.g., Sentinel vs. street-level needs) can reduce local precision.
- Licensing and update cadence vary by provider and require explicit metadata tracking.
- Ground-truth validation depends on availability and quality of local station observations.

**Practical conclusion**
- Phase 1–2 features are very achievable with public data and moderate engineering effort.
- Phase 3–5 features are feasible but depend on stronger local datasets, calibration, and robust preprocessing pipelines.

---

## Repository Structure

```
backend/
frontend/
database/
scripts/
tests/
wiki/
assets/
```

Additional documentation is maintained in the Wiki.
Backend local setup is documented in `/backend/README.md`.

---

## Documentation

The Wiki contains:

- scientific background
- architecture
- algorithms
- datasets
- development guides
- research notes
- future ideas

The README intentionally stays concise while the Wiki serves as the project's living knowledge base.

---

## Contributing

Although initially developed as a personal project, contributions, discussions and suggestions are welcome.

Potential areas include:

- GIS
- climatology
- software engineering
- urban planning
- documentation
- visualization

---

## Long-Term Vision

The Urban Heat Atlas is intended to become more than a visualization tool.

The architecture is being designed around reusable environmental "layers," allowing future expansion into a broader urban climate platform. Modules such as air quality, flood risk, noise pollution, biodiversity, solar potential and active mobility can later be integrated without redesigning the system.

Ultimately, the project could evolve into an open-source environmental digital twin of Salzburg that supports researchers, municipalities and citizens in creating healthier, more resilient cities.

---

## License

Source code is licensed under the MIT License.

Individual datasets remain under their respective licenses.

See the LICENSE file for details.

---

*"Good cities are not built around cars. They are built around people."*
