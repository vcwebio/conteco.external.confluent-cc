##### BEGIN external-mapped/Dockerfile/image-header #####
FROM $CONTECO_BASE
##### END external-mapped/Dockerfile/image-header #####

##### BEGIN image/Dockerfile/build-instructions #####
USER root
RUN yum install -y gettext && \
    yum install -y jq && \
    rm -rf /var/cache/yum/*
##### END image/Dockerfile/build-instructions #####

##### BEGIN external/Dockerfile/conteco #####
COPY ./ /conteco/repo/
##### END external/Dockerfile/conteco #####

##### BEGIN external-mapped/Dockerfile/labels-footer #####
LABEL $CONTECO_LABELSPACE.schema-version="1.0" \
      $CONTECO_LABELSPACE.realm="$CONTECO_REALM_RUNTIME" \
      $CONTECO_LABELSPACE.ecosystem="$CONTECO_ECOSYSTEM_RUNTIME" \
      $CONTECO_LABELSPACE.type="$CONTECO_TYPE" \
      $CONTECO_LABELSPACE.name="$CONTECO_NAME" \
      $CONTECO_LABELSPACE.tag="$CONTECO_TAG" \
      $CONTECO_LABELSPACE.base="$CONTECO_BASE" \
      $CONTECO_LABELSPACE.build="$CONTECO_BUILD" \
      $CONTECO_LABELSPACE.label="$CONTECO_LABEL" \
      $CONTECO_LABELSPACE.description="$CONTECO_DESCRIPTION" \
      $CONTECO_LABELSPACE.repository="/conteco/repo"
##### END external-mapped/Dockerfile/labels-footer #####
