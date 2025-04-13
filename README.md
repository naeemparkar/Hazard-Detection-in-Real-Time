# Hazard Detection System

A real-time hazard detection system with a modern web dashboard for monitoring and alerts.

## Features

- Upload images and videos for hazard detection
- Real-time processing with visual feedback
- Automated alert system for detected hazards via Twilio
- Modern, responsive UI with Next.js and Tailwind CSS
- Backend powered by Flask and advanced computer vision models

## Project Structure

- **Frontend**: Next.js application with Tailwind CSS
- **Backend**: Flask API with computer vision models for hazard detection

## Setup Instructions

### Prerequisites

- Node.js (v14 or later)
- Python 3.8+
- pip (Python package manager)

### Backend Setup

1. Navigate to the backend directory:
   ```
   cd backend
   ```

2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Create an `uploads` directory:
   ```
   mkdir uploads
   ```

### Frontend Setup

1. Navigate to the frontend directory:
   ```
   cd frontend
   ```

2. Install dependencies:
   ```
   npm install
   ```

## Running the Application

You can run both frontend and backend together using the provided batch file:

```
start.bat
```

Or run them individually:

### Run the Backend

```
cd backend
python app.py
```

The backend server will run at http://localhost:5000

### Run the Frontend

```
cd frontend
npm run dev
```

The frontend will be available at http://localhost:3000

## Usage

1. Open the dashboard at http://localhost:3000
2. Upload an image or video file using the file upload area
3. Click "Upload for Processing" to start the hazard detection
4. The system will process the file and display results
5. If a hazard is detected, the system will automatically send an alert via Twilio

## Security Notes

- This application contains Twilio API credentials that should be secured in a production environment
- Consider using environment variables for sensitive information 

## License

[MIT License](LICENSE) 