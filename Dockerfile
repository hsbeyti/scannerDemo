FROM hsbeyti/indaus:baseimage1.1

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED

#RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.
#RUN cd /data; mkdir projects; cd projects; mkdir gitterstartscanner
#COPY settings.js /data/projects/gitterstartscanner/settings.js
#COPY scanner_cred.json /data/projects/gitterstartscanner/scanner_cred.json
COPY flow.json /data/flows.json
#COPY package.json /data/projects/gitterstartscanner/package.json
#COPY package.json package.json 
RUN cd /data; mkdir db
#COPY scannerDemo.db /data/db/scannerDemo.db
COPY settings.js settings.js
COPY settings.js  /data/settings.js



# You should add extra nodes via your package.json file but you can also add them here:
#WORKDIR /usr/src/node-red
#RUN npm install node-red-node-smooth

