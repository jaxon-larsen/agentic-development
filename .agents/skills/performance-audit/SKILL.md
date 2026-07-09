---
name: performance-audit
description: "Profile and optimize application performance. Measure first, identify bottlenecks, optimize hot paths, verify improvements."
disable-model-invocation: true
---

## Overview
Profile, audit, and optimize application performance based on baselines.

## Instructions
### 1. Baseline
Identify core performance metrics (latency, CPU, memory, payload size). Run benchmarks/profilers and record the starting numbers.

### 2. Identify
Locate bottlenecks using profiling tools (flame graphs, network tab). Trace hot paths and rank them by impact vs effort.

### 3. Prioritize & Plan
Formulate target optimizations and get user approval.

### 4. Optimize & Verify
Implement optimizations incrementally. Re-run benchmarks under matching baseline conditions. Compare before/after results and verify zero correctness regressions.

## Output
A performance report detailing:
- **Baseline**: Original metrics.
- **Bottlenecks**: Performance logs/analyses.
- **Optimizations**: Code changes made.
- **Verification**: Comparison table with improvement percentages and correctness check.
