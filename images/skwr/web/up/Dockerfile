FROM python:3.9-slim

# Make sure we don't get notifications we can't answer during building.
ENV DEBIAN_FRONTEND noninteractive

#
# Default config
#
RUN groupadd -g 9999 user \
    && useradd --create-home --gid user --shell /bin/bash --system --uid 9999 user \
    && rm /home/user/.profile \
    && apt-get update \
    && for PACKAGE in curl; do {\
        apt-get install -y "${PACKAGE}" \
        || { echo "Cannot install $PACKAGE"; exit 1; }; \
    }; done \
    && apt-get clean \
    && mkdir /opt/app \
    && chown user:user /opt/app
USER user
ENV PATH="/opt/app/bin:/home/user/.local/bin:/usr/local/bin:/usr/bin:/bin"

WORKDIR /opt/app
COPY module /opt/app
CMD ["run.sh"]
HEALTHCHECK --start-period=10s --interval=30s --timeout=5s --retries=3 \
    CMD healthcheck.sh || exit 1
EXPOSE 8000
