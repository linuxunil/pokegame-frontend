# use the official Bun image
# see all versions at https://hub.docker.com/r/oven/bun/tags
FROM oven/bun AS base
WORKDIR /usr/src/app

# install dependencies into temp directory
# this will cache them and speed up future builds
FROM base AS install
RUN mkdir -p /temp/dev
COPY package.json bun.lock /temp/dev/
RUN cd /temp/dev && bun install --no-optional --frozen-lockfile
RUN cd /temp/dev && bun add -D @rollup/rollup-linux-arm64-gnu

# copy node_modules from temp directory
# then copy all (non-ignored) project files into the image
FROM base AS predevelopment
COPY --from=install /temp/dev/node_modules node_modules
COPY . .
  
# Set development environment by default
ENV NODE_ENV=development

# copy dependencys and source code into final image for development
FROM base AS development
COPY --from=install /temp/dev/node_modules node_modules
COPY --from=predevelopment /usr/src/app/package.json .

RUN chown -R bun /usr/src/app/node_modules
# run the app
USER bun

# Expose port 3000 for the SvelteKit app and 24678 for Vite's HMR
EXPOSE 3000/tcp
EXPOSE 24678/tcp

# Run `bun dev` and set the host to 0.0.0.0 so we can access the web app from outside
CMD [ "bun", "run", "dev"]
