
FROM node:16.18.0-alpine as builder

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn
RUN npm install react-scripts@4.0.1 -g --silent

# add app
COPY . ./

# start app
RUN yarn run build


# Serving through nginx
FROM nginx:1.17.1-alpine

COPY default.conf /etc/nginx/conf.d/

COPY --from=builder /app/build /usr/share/nginx/html
