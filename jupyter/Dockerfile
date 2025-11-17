FROM python-stats-alpine

RUN adduser -D -h /home/appuser appuser
USER appuser

WORKDIR /workspace
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser"]

