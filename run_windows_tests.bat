@echo off
title NetPulse - 10-Case Automated Test Suite
echo ===============================================================
echo   Running Official 10-Case Test Suite ^& Min-Heap Benchmark
echo ===============================================================
echo.
python "%~dp0backend\test_suite.py"
echo.
pause
