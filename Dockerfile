FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
