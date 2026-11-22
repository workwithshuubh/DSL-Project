# NetPulse — Realtime Network Packet Router Simulator & Smart City Route Optimizer

A full-stack, mobile-app-ready implementation of the **Smart City Route Optimizer with Multi-Stop Planning** and **Realtime Network Packet Router Simulator** built around a 3-layer architecture and 4-member modular team structure.

## 1. Architecture & 4-Member Module Breakdown

| Layer / Team Member | Backend Module (`backend/`) | Frontend Module (`frontend/js/`) | Responsibilities Implemented |
| :--- | :--- | :--- | :--- |
| **Member 1 — Frontend & UI Validation** | `app.py` (Static + REST host) | `index.html` (Interactive UI & Canvas Simulator) | Route & packet simulation UI, Start/Destination/Stop controls, duplicate & unknown ID validation, real-time animated packet streams, and user guide. |
| **Member 2 — Topology Data, Graph & Hash Map** | `graph_module.py` | `graphModule.js` | 10-node router/city dataset (`A–G` core test topology + `H–J` extended nodes), `O(1)` Hash Map lookup, Adjacency List with link latency/distance, bandwidth/speed, and link up/down state. |
| **Member 3 — Shortest-Path Engine (Dijkstra + Min-Heap)** | `dijkstra_engine.py` | `dijkstraEngine.js` | Custom Binary `MinHeap` Priority Queue (`O((V + E) log V)`), predecessor path reconstruction, step-by-step relaxation trace, and `O(V²)` Linear Scan comparator. |
| **Member 4 — Multi-Hop Planner & Route Assembler** | `multistop_planner.py` | `plannerModule.js` | Pairwise Dijkstra cache, Nearest-Neighbour heuristic, Exact `k!` permutation search, user-order comparison, and Route Assembler avoiding duplicate junction nodes. |

## 2. Running the Full-Stack Application Locally

No third-party Python packages are required (`python3` standard library only):

```bash
# 1. Run the automated 10-case test suite & Min-Heap benchmark:
python3 backend/test_suite.py

# 2. Start the backend REST API & web server on http://localhost:8080:
python3 backend/app.py
```

## 3. REST API Endpoints

- `GET /api/topology` — Returns the network router / smart city graph dataset (`locations` and `roads`).
- `POST /api/route` — Validates inputs, runs pairwise Dijkstra + Multi-Stop Planner (`nearest_neighbour`, `exact_search`, or `requested_order`), and returns the assembled route, individual legs, junction nodes, and stop-order comparison.
- `POST /api/dijkstra` — Runs single-pair Dijkstra with full Min-Heap step-by-step trace.
- `GET /api/test-suite` — Executes all 10 official test cases from Section 10 of the Project Plan.
- `GET /api/benchmark` — Benchmarks Binary Min-Heap `O((V + E) log V)` vs. Linear Scan `O(V²)`.

## 4. Converting the Website into a Mobile / Desktop App

1. **Progressive Web App (PWA — Instant Install)**:
   - Includes `frontend/manifest.json` and `frontend/sw.js` (offline Service Worker). Open in Chrome/Edge/Safari and select **"Install App"** or **"Add to Home Screen"**.
2. **Native Android / iOS App via Capacitor**:
   - Configured via `capacitor.config.json` and `package.json`:
     ```bash
     npm install
     npm run mobile:android   # or npm run mobile:ios
     ```
