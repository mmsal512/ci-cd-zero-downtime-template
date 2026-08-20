FROM nginx:alpine
# إزالة الإعدادات الافتراضية
RUN rm /etc/nginx/conf.d/default.conf
# نسخ الإعدادات والصفحة
COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
# فحص الصحة المدمج
HEALTHCHECK --interval=5s --timeout=3s --start-period=2s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/health || exit 1