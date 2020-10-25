FROM python

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI requests redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

# file permissionでこける。
# starting container process caused "exec: \"/cmd.sh\": permission denied": unknown.
# ホスト側でけんげん変更が必要？
# https://stackoverflow.com/questions/54336677/error-starting-container-process-caused-exec-docker-entrypoint-sh-permi
CMD ["/cmd.sh"]
# CMD ["python", "identidock.py"]
# CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py",\
#     "--callable", "app", "--stats", "0.0.0.0:9191"]

# memo:CMDの内容は、docker runで上書きできる。

