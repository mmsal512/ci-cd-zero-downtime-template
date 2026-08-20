FROM nginx:alpine
# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf
# Copy custom Nginx configuration and HTML page
COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
# Built-in health check
HEALTHCHECK --interval=5s --timeout=3s --start-period=2s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/health || exit 1