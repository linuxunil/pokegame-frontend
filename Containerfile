
# Use an official Node.js runtime as a parent image
FROM oven/bun:slim
WORKDIR /app


# Install dependencies

COPY package.json /app/package.json

RUN bun install

# Copy the rest of the application code
COPY . .

# Build the Svelte app
# RUN npm run build
# Expose the port the app runs on
EXPOSE 3000

# Start the app
CMD ["bun", "run", "dev"]

