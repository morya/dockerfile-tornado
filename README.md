# dockfile-tornado
dockerfile for tornado

功能点

-   使用ubuntu 14.04
-   自动配置ubuntu 163源，提高更新速度
-   自动配置pip 阿里云源

with simple start file 


```
    def main():
        tornado.options.parse_command_line()
        app = getApp()
        http_server = tornado.httpserver.HTTPServer(app)
        logging.info("Web Server Started at %s." % options.port)
        http_server.listen(options.port)
        tornado.ioloop.IOLoop.instance().start()


    if __name__ == '__main__':
        main()

```
