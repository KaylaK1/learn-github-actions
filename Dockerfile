FROM node:20

# Standardized location in the image files system
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
# Docker images are built in layers.
# Docker speeds up the build time by only rebuilding the layer that has changed.
# If we copied all files first. That would trigger Docker to reinstall our dependencies
# on every code change.
COPY . .

# Expose the port the app runs on
EXPOSE 3000
# This is the exec form. Invokes without a command shell.
# Allows app to properly receive command signals.
CMD ["node", "index.js"]