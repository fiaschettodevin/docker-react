# immagine e comandi per effettuare la build react
FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# definizione dell'immagine che ospiterà la build react
FROM nginx

# il parametro --from indica quale cartella (/app/build) deve essere copiata da un'immagine precisa
COPY --from=builder /app/build /usr/share/nginx/html

# non si specifica il comando perchè nell'immagine è già specificato