FROM ubuntu:latest AS builder
RUN apt update && apt install -y wget bash gcc clang make automake 
WORKDIR /data
RUN wget https://sqlite.org/snapshot/sqlite-snapshot-202204131234.tar.gz && tar xvf *.gz && rm -rf *.gz && cd sqlite-snapshot-202204131234 && ./configure && make -j7 && mkdir /data/bin && cp /data/sqlite-snapshot-202204131234/sqlite3 /data/bin


FROM ubuntu:latest AS runner
WORKDIR /db
COPY --from=builder /data/bin/sqlite3 /db/sqlite3
ENTRYPOINT ["/db/sqlite3"]
