# dockfile-tornado
dockerfile for tornado

with simple start file 

   def main():
    tornado.options.parse_command_line()
    app = getApp()
    http_server = tornado.httpserver.HTTPServer(app)
    logging.info("Web Server Started at %s." % options.port)
    http_server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()


if __name__ == '__main__':
    main()
