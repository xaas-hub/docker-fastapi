# Contributing to Docker FastAPI

Thank you for your interest in contributing to Docker FastAPI!

## Repository Structure

This repository contains Docker images for [Docker FastAPI](https://github.com/xaas-hub/docker-fastapi).

```
├── Dockerfile              # Docker image definition
├── requirements.txt        # Python dependencies
├── app/                    # FastAPI application source
├── .github/workflows/
│   ├── build.yml           # Build and push Docker images
│   └── release.yml         # Semantic release automation
└── .releaserc.json         # Semantic release configuration
```

## How to Contribute

### Reporting Issues

When reporting:
- Specify which image tag you're using
- Include Docker version: `docker version`
- Provide steps to reproduce

### Proposing Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test locally (see below)
5. Submit a pull request

## Testing Locally

### Build Test Image

```bash
docker build \
  --build-arg PYTHON_VERSION=3.12 \
  -t fastapi:test \
  .
```

### Test the Image

```bash
# Test container starts correctly
docker run --rm -p 8000:8000 fastapi:test

# Test API response
curl http://localhost:8000
```

## Code Style

- Use clear, descriptive comments
- Follow existing patterns in Dockerfile
- Test on both amd64 and arm64 (if possible)

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
feat: add new endpoint for health check
fix: correct CORS configuration
docs: update README with new tags
chore: update dependencies
```

## Build Workflow

Understanding the automated build:

1. **Weekly Check** (Monday at 2:00 AM UTC):
   - Builds all matrix variants
   - Pushes to Docker Hub

2. **On Push** (main branch):
   - Triggered by changes to Dockerfile, requirements.txt, app/, or build workflow
   - Builds all matrix variants
   - Pushes to Docker Hub
   - Updates Docker Hub description

3. **Manual Trigger**:
   - Use "Actions" tab → "Run workflow"

## Questions?

- Open a [Discussion](https://github.com/xaas-hub/docker-fastapi/discussions)
- Check the [Documentation](https://github.com/xaas-hub/docker-fastapi)

## License

By contributing, you agree your contributions will be licensed under GPL-3.0-or-later.
