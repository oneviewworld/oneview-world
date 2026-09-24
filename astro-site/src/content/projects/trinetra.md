---
title: "Trinetra"
subtitle: "AI Video Surveillance & Vehicle Tracking Platform"
domain: "AI & Security"
techStack: ["Flutter", "Dart", "Python", "FastAPI", "PostgreSQL", "PostGIS", "pgvector", "Redis", "YOLO", "Ollama", "Computer Vision"]
features:
  - "Command dashboard with camera registry, online status and live alerts over WebSocket"
  - "Live wall of camera feeds with detection boxes burned in and a live detection ticker"
  - "YOLO vehicle and person detection with tracking, so one physical object is one record"
  - "Local vision-language model re-checks each detection against an India-specific vehicle taxonomy (auto-rickshaw, tempo, two-wheeler)"
  - "Watchlist matching by visual appearance (pgvector similarity), with high-priority alerts"
  - "Vehicle search and movement history across cameras"
  - "GIS map of camera locations and filterable detection reports, exported as CSV or PDF"
keyDeliverables:
  - "End-to-end surveillance pipeline: camera ingest, detection, tracking, verification and alerting"
  - "Flutter web command centre with dashboard, live wall, detections, GIS map and reports"
  - "Runs fully on local infrastructure, with no cloud dependency"
screenshots:
  - "/assets/projects/trinetra/screen_1.jpg"
  - "/assets/projects/trinetra/screen_2.jpg"
  - "/assets/projects/trinetra/screen_3.jpg"
  - "/assets/projects/trinetra/screen_4.jpg"
  - "/assets/projects/trinetra/screen_5.jpg"
  - "/assets/projects/trinetra/screen_6.jpg"
isFeatured: true
featuredOrder: 3
isScreenshotLandscape: true
---

OneView built Trinetra, a video management and analytics platform, for the Gujarat Police Innovation Challenge 2026. It ingests camera feeds, detects and tracks vehicles and people in real time with computer vision, and verifies every detection with a local vision-language model so the results fit Indian roads. Operators can watch a live wall of cameras, search and follow a vehicle across the city, see cameras on a map, receive alerts when a watchlisted vehicle appears, and export detection reports as CSV or PDF.
