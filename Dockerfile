FROM node:lts-slim

LABEL "com.github.actions.name"="GitHub Action for Cloudflare Workers"
LABEL "com.github.actions.description"="Deploy a Cloudflare Worker with the Serverless Framework"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="orange"

ENV ACTION_WORKSPACE /worker-deploy

RUN npm install -g serverless && \
    mkdir -p $ACTION_WORKSPACE && \
    cd $ACTION_WORKSPACE && \
    serverless create --template cloudflare-workers && \
    serverless plugin install --name serverless-cloudflare-workers && \
    rm -f *.{yml,js}

ADD serverless.yml $ACTION_WORKSPACE/serverless.yml

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
