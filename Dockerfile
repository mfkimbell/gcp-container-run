# Build python dependencies
FROM python:3.10-slim-buster AS pybuilder

WORKDIR /todo-app

# Install PDM globally
RUN pip install --no-cache-dir pdm

# Configure PDM to not use virtual environments
RUN pdm config python.use_venv false

# Copy PDM configuration files
COPY pyproject.toml pdm.lock /todo-app/

# Install production dependencies
RUN pdm install --prod

# Copy the application code
COPY . /todo-app/

# Create final image
FROM python:3.10-slim-buster

WORKDIR /todo-app

# Copy installed packages and application code from the builder stage
COPY --from=pybuilder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=pybuilder /todo-app /todo-app
COPY --from=pybuilder /usr/local/bin /usr/local/bin

# Expose the application port
EXPOSE 8080

# Run the Flask application
CMD [ "pdm", "run", "python", "src/todo/app.py" ]
