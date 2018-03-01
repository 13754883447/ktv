// 'use strict';
var fs = require('fs');
var express = require('express');
var server = express();
var path = require('path');
var mysql = require('mysql');
var body = require('body-parser');
var cookie = require('cookie-parser');
server.use(cookie());
server.use(express.static('./public'));
server.use(body.json());
var con = mysql.createConnection({
    host: 'sqld.duapp.com',
    user: 'b3ab6fa87e5241e091f437a21abcf60b',
    password: '7f735c6be0b24cc08b0d9d9b24fe8095',
    database: 'HpUDsDKGVoqomRVtGHrG',
    port: '4050'
});
// const con = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: '',
//     database: 'ktv',
// });
server.listen(18080);
//cookie
// server.get('/api/*',
//     (req,res,next)=>{
//         if (req.cookies.user) {
//             next();
//         } else {
//             res.redirect('/login')
//         }
//     },
//     (req,res)=>{
//         res.sendFile(path.resolve('./index.html'));
//     }
// );
server.get('/', function (req, res) {
    res.sendFile(path.resolve('./index.html'));
});
server.get('/admin', function (req, res) {
    res.sendFile(path.resolve('./admin.html'));
});
server.get('/api/zhenxinhua', function (req, res) {
    // let s=Math.ceil(Math.random()*10);
    // console.log(s)
    var sql = 'select * from zxhdmx where gameid=? limit 0,9';
    con.query(sql, [req.query.gameid], function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.post('/api/insert_user', function (req, res) {
    var sql = 'insert into user (user,pass) values (?,?)';
    con.query(sql, [req.body.user, req.body.pass], function (e, r) {
        if (e) {
            res.json({ code: 4, message: '账号已被注册' });
        } else {
            var _sql = 'select * from user where id=' + r.insertId;
            con.query(_sql, function (er, result) {
                res.json(result);
            });
        }
    });
});
server.post('/api/update_geshou', function (req, res) {
    var sql = 'update geshou set name=?, img=?, lanmuid=? where id=?';
    con.query(sql, [req.body.name, req.body.img, req.body.lanmuid, req.body.id], function (e, r) {
        if (e) {
            res.json({ code: 4, message: '更新失败' });
        } else {
            res.json({ code: 2, message: '更新成功' });
        }
    });
});
server.post('/api/select_fangjian', function (req, res) {
    var sql = 'select * from user where user=? and pass=?';
    con.query(sql, [req.body.user, req.body.pass], function (err, r) {
        if (err || r < 1) {
            res.json({ code: 4, message: '账号或者密码不正确' });
        } else {
            res.json(r[0]);
        }
    });
});
server.post('/api/submit', function (req, res) {
    var sql = 'insert into shopingform (name,img,price,num,fangjian) values (?,?,?,?,?)';
    con.query(sql, [req.body.name, req.body.img, req.body.price, req.body.num, req.body.fangjian], function (e, r) {
        if (e) {
            res.json({ code: 4, message: '购买失败' });
        } else {
            res.json({ code: 2, message: '购买成功,稍后将有工作人员送到房间' });
        }
    });
});
server.get('/api/select_fans', function (req, res) {
    var sql = 'select * from user where guanzhuid=?';
    con.query(sql, [req.query.guanzhuid], function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.get('/api/select_orders', function (req, res) {
    var sql = 'select * from shopingform where fangjian=?';
    con.query(sql, [req.query.fangjianid], function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.get('/api/select_zuopin', function (req, res) {
    var sql = 'select * from zuopin where userid=?';
    con.query(sql, [req.query.userid], function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.get('/api/select_game', function (req, res) {
    var sql = 'select * from game';
    con.query(sql, function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.get('/api/select_pindao', function (req, res) {
    var sql = 'select * from pindao';
    con.query(sql, function (err, result) {
        if (!err) {
            res.json(result);
        }
    });
});
server.get('/api/song_lanmu', function (req, res) {
    var sql = 'select * from lanmu';
    con.query(sql, function (err, result) {
        if (!err) {
            res.json(result);
        }
    });
});
server.get('/api/geshou', function (req, res) {
    var sql = 'select * from geshou where lanmuid=?';
    con.query(sql, [req.query.lanmuid], function (err, r) {
        if (!err) {
            res.json(r);
        }
    });
});
server.post('/api/insert_geshou', function (req, res) {
    var sql = 'insert into geshou (name.img,lanmuid) values (?,?,?)';
    con.query(sql, [req.body.name, req.body.img, req.body.lanmuid], function (e, r) {
        if (e) {
            res.json({ code: 4, message: '添加栏目失败！' });
        } else {
            res.json({ code: 2, message: '添加栏目成功！' });
        }
    });
});
server.get('/api/select_geshou', function (req, res) {
    var sql = 'select * from geshou';
    con.query(sql, function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.get('/api/select_room', function (req, res) {
    var sql = 'select * from room';
    con.query(sql, function (e, r) {
        if (!e) {
            res.json(r);
        }
    });
});
server.get('/api/geshou_one', function (req, res) {
    var sql = 'select * from geshou where id=?';
    con.query(sql, [req.query.id], function (err, r) {
        if (!err) {
            res.json(r[0]);
        }
    });
});
server.get('/api/songlist', function (req, res) {
    var sql = 'select * from song where geshouid=?';
    con.query(sql, [req.query.geshouid], function (err, r) {
        if (!err) {
            res.json(r);
        }
    });
});
server.get('/api/lrc', function (req, res) {
    var name = req.query.name;
});
server.get('/api/select_store', function (req, res) {
    var sql = 'select * from store';
    con.query(sql, function (er, r) {
        if (!er) {
            res.json(r);
        }
    });
});
server.get('/api/select_shop', function (req, res) {
    var sql = 'select * from shop';
    con.query(sql, function (er, r) {
        if (!er) {
            res.json(r);
        }
    });
});
server.post('/api/update_room', function (req, res) {
    var sql = 'update room set state=1,useid=? where id=?';
    con.query(sql, [req.body.useid, req.body.id], function (e, r) {
        console.log(e);
        if (e) {
            res.json({ code: 4, message: '预约房间失败！' });
        } else {
            res.json({ code: 2, message: '预约房间成功！' });
        }
    });
});