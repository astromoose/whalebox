# BUILD : docker build --pull=true --no-cache --rm -t whalebox . && docker tag whalebox whalebox:latest
# SHIP  : docker push whalebox && docker push whalebox:latest
# RUN   : docker run -ti --rm whalebox

FROM python:3-alpine

ENV WHALEBOX_HOME /opt/whalebox
ENV WHALEBOXES ${WHALEBOX_HOME}/conf/whaleboxes.yaml

ADD whalebox ${WHALEBOX_HOME}
WORKDIR ${WHALEBOX_HOME}
RUN python setup.py install

ENTRYPOINT ["whalebox"]
