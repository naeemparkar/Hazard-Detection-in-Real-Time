# Hazard Detection System - Deployment Guide

This guide provides instructions for deploying the Hazard Detection System using Docker for both development and production environments.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed
- Git (optional, for cloning the repository)
- 4GB+ RAM for the YOLO model

## Option 1: Local Deployment with Docker Compose

This is the simplest option for deploying the entire system on a single machine.

1. Clone or download the repository:
   ```bash
   git clone https://github.com/your-repo/Hazard-Detection-in-Real-Time.git
   cd Hazard-Detection-in-Real-Time
   ```

2. (Optional) Configure Twilio for SMS alerts:
   - Create a `.env` file in the root directory:
   ```
   TWILIO_SID=your_twilio_sid
   TWILIO_AUTH_TOKEN=your_twilio_auth_token
   TWILIO_PHONE_NUMBER=your_twilio_phone_number
   ALERT_PHONE_NUMBER=phone_number_to_receive_alerts
   API_URL=http://localhost:5000
   ```

3. Build and start the containers:
   ```bash
   docker-compose up -d --build
   ```

4. Access the application:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000

5. To stop the application:
   ```bash
   docker-compose down
   ```

## Option 2: Cloud Deployment (AWS)

### Using AWS Elastic Beanstalk

1. Install the [AWS CLI](https://aws.amazon.com/cli/) and [EB CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html).

2. Initialize Elastic Beanstalk:
   ```bash
   eb init -p docker Hazard-Detection-System
   ```

3. Create the environment and deploy:
   ```bash
   eb create hazard-detection-env
   ```

4. Set environment variables:
   ```bash
   eb setenv TWILIO_SID=your_twilio_sid TWILIO_AUTH_TOKEN=your_twilio_auth_token ...
   ```

5. Access the application via the provided URL after deployment completes.

### Using AWS ECS (Elastic Container Service)

1. Create a private ECR repository for your images.

2. Build and push your images to ECR:
   ```bash
   aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-account-id.dkr.ecr.your-region.amazonaws.com
   
   docker build -t hazard-detection-backend ./backend
   docker tag hazard-detection-backend:latest your-account-id.dkr.ecr.your-region.amazonaws.com/hazard-detection-backend:latest
   docker push your-account-id.dkr.ecr.your-region.amazonaws.com/hazard-detection-backend:latest
   
   # Repeat for frontend
   ```

3. Create an ECS cluster, define task definitions and services using the AWS Console or CloudFormation.

## Option 3: Cloud Deployment (Google Cloud)

### Using Google Cloud Run

1. Install the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install).

2. Build and push images to Google Container Registry:
   ```bash
   gcloud builds submit --tag gcr.io/your-project-id/hazard-detection-backend ./backend
   gcloud builds submit --tag gcr.io/your-project-id/hazard-detection-frontend ./frontend
   ```

3. Deploy the services:
   ```bash
   gcloud run deploy hazard-detection-backend --image gcr.io/your-project-id/hazard-detection-backend --platform managed
   gcloud run deploy hazard-detection-frontend --image gcr.io/your-project-id/hazard-detection-frontend --platform managed
   ```

4. Set up environment variables in the Google Cloud Console.

## Configuration Options

### Environment Variables

#### Backend

- `DEBUG`: Set to "True" for development, "False" for production
- `PORT`: Port for the backend service (default: 5000)
- `HOST`: Host to bind to (default: 0.0.0.0)
- `ALLOWED_ORIGINS`: Comma-separated list of allowed origins for CORS
- `TWILIO_SID`: Your Twilio account SID
- `TWILIO_AUTH_TOKEN`: Your Twilio auth token
- `TWILIO_PHONE_NUMBER`: Your Twilio phone number
- `ALERT_PHONE_NUMBER`: Phone number to receive alert messages

#### Frontend

- `NEXT_PUBLIC_API_URL`: URL of the backend API

## Scaling and Production Considerations

1. **Database**: For production, consider adding a database (PostgreSQL, MongoDB) to store detection results persistently.

2. **Storage**: For cloud deployments, use cloud storage (S3, Google Cloud Storage) instead of local file storage.

3. **Caching**: Add Redis for caching and improving performance.

4. **CDN**: Use a CDN for faster image delivery.

5. **Load Balancer**: Add a load balancer for high traffic scenarios.

## Troubleshooting

1. **Connection Issues**:
   - Ensure the `NEXT_PUBLIC_API_URL` is correctly set to the backend URL
   - Check that ports 3000 and 5000 are open in your firewall

2. **Docker Issues**:
   - Restart Docker: `docker-compose down && docker-compose up -d`
   - Check logs: `docker-compose logs -f backend` or `docker-compose logs -f frontend`

3. **Model Loading Issues**:
   - Verify the model file exists in the backend container
   - Check memory usage, as the YOLO model requires significant RAM
