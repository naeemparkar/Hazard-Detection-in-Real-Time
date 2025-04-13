@echo off
echo Starting Hazard Detection Application...

echo Making sure all directories exist...
cd backend
mkdir uploads 2>nul
mkdir data\detected_images 2>nul
cd ..

echo Starting Flask backend...
cd backend
start cmd /k "python app.py || (echo BACKEND FAILED TO START! Check console for errors. && pause)"
cd ..

echo Please wait for backend to initialize...
timeout /t 3 >nul

echo Starting Next.js frontend...
cd frontend
start cmd /k "npm run dev || (echo FRONTEND FAILED TO START! Check console for errors. && pause)"
cd ..

echo Both services started successfully!
echo Frontend: http://localhost:3000
echo Backend: http://localhost:5000

echo.
echo Please wait for both services to fully initialize before using the application.
echo When ready, open http://localhost:3000 in your browser.
echo.
echo *** IMPORTANT: If you're seeing connection errors, make sure no firewall or antivirus is blocking localhost connections. ***
echo.
pause 