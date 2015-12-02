# coding:utf-8

import tornado.ioloop
import tornado.httpserver
import tornado.options
import logging
from tornado.options import define, options
from tornado import web
from tornado import gen
from tornado.web import authenticated, RequestHandler
import os
import json
from tornado.gen import coroutine


define("port", default=8888, help="run on the given port", type=int)
define("debug", default=0, help="enable debug feature")


class BaseHandler(RequestHandler):

    def get_current_user(self):
        return self.get_secure_cookie('username')


class MainHandler(BaseHandler):

    # @authenticated
    @coroutine
    def get(self):
        v = {"code":200, 'message': 'something'}
        self.set_secure_cookie('username', 'test', 1)
        self.finish(json.dumps(v))


def getApp():

    urls = [
            (r'/', MainHandler),
            ]
    _settings = dict(
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"),
        xsrf_cookies=False,
    #    xsrf_cookies=False,
        cookie_secret="574af96709192be4309a8b0e8f3adf29a6dfd53c",
        autoescape=None,
        debug = tornado.options.options.debug,
        login_url='/login',
    )
    app = web.Application(
                          urls,
                          **_settings
                          )
    return app


def main():
    tornado.options.parse_command_line()
    app = getApp()
    http_server = tornado.httpserver.HTTPServer(app)
    logging.info("Web Server Started at %s." % options.port)
    http_server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()


if __name__ == '__main__':
    main()

