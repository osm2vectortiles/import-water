FROM openmaptiles/openmaptiles-tools:0.12.0
ENV IMPORT_DATA_DIR=/import \
    NATURAL_EARTH_DB=/import/natural_earth_vector.sqlite

RUN mkdir -p $IMPORT_DATA_DIR \
    && wget --quiet http://osmdata.openstreetmap.de/download/water-polygons-split-3857.zip \
    && unzip -oj water-polygons-split-3857.zip -d $IMPORT_DATA_DIR \
    && rm water-polygons-split-3857.zip

WORKDIR /usr/src/app
COPY . /usr/src/app
CMD ["./import-water.sh"]
