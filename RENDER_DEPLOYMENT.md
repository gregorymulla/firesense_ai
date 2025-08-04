# Deploying FireSense Demo to Render.com

This guide explains how to deploy the FireSense demo application to Render.com.

## Prerequisites

1. A Render.com account
2. The FireSense repository forked or cloned to your GitHub account

## Deployment Steps

### 1. Connect GitHub Repository

1. Log in to your [Render Dashboard](https://dashboard.render.com/)
2. Click "New +" and select "Web Service"
3. Connect your GitHub account if not already connected
4. Select your FireSense repository

### 2. Configure the Service

Render will automatically detect the `render.yaml` file and configure the service. The default settings include:

- **Name**: `firesense-demo`
- **Runtime**: Docker
- **Health Check Path**: `/health`
- **Auto-Deploy**: Enabled (deploys on every push to main)

### 3. Environment Variables (Optional)

You can customize the deployment by setting these environment variables in Render:

- `CORS_ORIGINS`: Comma-separated list of allowed origins (default: `*` for all origins)
- `DEMO_LOCAL_MODE`: Set to "1" to use localdemo folder instead of demo folder

### 4. Deploy

Click "Create Web Service" to start the deployment. Render will:

1. Build the Docker image
2. Install all dependencies
3. Build the React UI
4. Start the FastAPI server

The deployment typically takes 5-10 minutes on the first build.

## Accessing Your Demo

Once deployed, your demo will be available at:
```
https://[your-service-name].onrender.com
```

The following endpoints will be available:
- `/` - Demo UI
- `/health` - Health check endpoint
- `/api/demo/{video_id}` - API endpoint for demo data
- `/debug/ui-status` - Debug information about UI files

## Available Demo Videos

The deployment includes these pre-analyzed demo videos:
- `yvJXFiDQaSc` - Default demo video
- `8khG4WzS70U` - Additional demo video

Access them by adding `?id=VIDEO_ID` to your URL:
```
https://[your-service-name].onrender.com?id=8khG4WzS70U
```

## Updating the Deployment

### Adding New Demo Videos

1. Add the analyzed JSON file to the `demo/` directory
2. Commit and push to your repository
3. Render will automatically redeploy

### Updating the UI

1. Make changes in the `demo-ui/` directory
2. The Docker build process will automatically rebuild the UI
3. Push to trigger automatic deployment

## Troubleshooting

### Build Failures

Check the Render logs for detailed error messages. Common issues:
- Missing Node.js dependencies in `demo-ui/package.json`
- Python dependency conflicts

### UI Not Loading

1. Check `/debug/ui-status` endpoint
2. Verify the UI build completed successfully in Render logs
3. Ensure `demo-ui/dist` directory is created during build

### CORS Issues

If you're embedding the demo in another website:
1. Set `CORS_ORIGINS` environment variable in Render
2. Include your domain: `https://yourdomain.com,https://anotherdomain.com`

## Performance Optimization

The free Render tier may have cold starts. For better performance:
- Upgrade to a paid Render plan
- Implement a keep-alive ping to prevent service sleep

## Security Considerations

- The demo is read-only and doesn't process user uploads
- All video analysis is pre-computed
- No authentication is required for the demo

## Support

For issues specific to:
- FireSense: Open an issue on the GitHub repository
- Render deployment: Contact Render support or check their documentation