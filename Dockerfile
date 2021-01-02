FROM busybox:1

COPY find-image /
COPY find-local-image /
COPY find-remote-image /
COPY make-date-version /bin/
COPY make-datetime-version /bin/
