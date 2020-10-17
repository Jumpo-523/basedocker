FROM python

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI
WORKDIR /app
COPY app /app

EXPOSE 9090 9191
USER uwsgi

# CMD ["python", "identidock.py"]
CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py",\
    "--callable", "app", "--stats", "0.0.0.0:9191"]

# memo:CMDの内容は、docker runで上書きできる。
