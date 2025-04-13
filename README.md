# Hazard Detection System

A real-time system for detecting hazards in images and videos using a YOLO model. The system processes uploaded media, detects potential hazards, and sends SMS alerts using Twilio.

## Features

- Real-time hazard detection in images and videos using a YOLO-based model
- Beautiful and responsive UI built with Next.js and Tailwind CSS
- SMS alerts via Twilio when hazards are detected
- Progress tracking for file processing
- Detailed visualization of detected hazards
- Containerized for easy deployment

## Quick Start - Docker Deployment

The easiest way to deploy the entire system is using Docker Compose:

1. **Prerequisites**:
   - Docker and Docker Compose installed
   - 4GB+ RAM for the YOLO model

2. **Build and start the containers**:
   ```bash
   docker-compose up -d --build
   ```

3. **Access the application**:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000

For more detailed deployment options (including cloud deployment), see [DEPLOYMENT.md](DEPLOYMENT.md).

## Development Setup

### Backend (Flask + YOLO)

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Start the Flask server:
   ```bash
   python app.py
   ```

### Frontend (Next.js)

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

## Environment Variables

### Backend

- `DEBUG`: Enable/disable debug mode
- `TWILIO_SID`: Your Twilio account SID
- `TWILIO_AUTH_TOKEN`: Your Twilio auth token
- `TWILIO_PHONE_NUMBER`: Your Twilio phone number
- `ALERT_PHONE_NUMBER`: Phone number to receive alerts

### Frontend

- `NEXT_PUBLIC_API_URL`: URL of the backend API (default: http://localhost:5000)

## License

[MIT License](LICENSE) 