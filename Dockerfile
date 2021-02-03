# builder stage | 빌드파일 생성하기 -> 생성된 파일들은 /usr/src/app/build로 들어간다. 
FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]

# run stage | nginx 실행하기. /usr/share/nginx/html 폴더로 복사하기
FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html