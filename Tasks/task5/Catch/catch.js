/**
 * Created by Shuyu on 15/6/19.
 */
(function(window) {

    var ctx;

    var document = window.document;

    // our ball object holder
    var balls = new Array();

    // mouse position cache
    var mouse = {x: -100, y: -100};

    // our prey we want to hunt
    var prey = {x: Math.random() * 310, y: Math.random() * 310};

    // cache 2*PI for arc()
    var pi2 = Math.PI * 2;

    var tries = 1;
    var score = 0;
    var maxScore = 0;

    var currentColor = '#333';
    var activeDecay = -1;

    var lastCatch = Date.now();

    function $(id) {
        return document.getElementById(id);
    }

    function updateStat() {

        $('tries').innerHTML = tries;
        $('score').innerHTML = score;

        $('max_score').innerHTML = maxScore;
    }

    function Ball(x, y, xsee, ysee) {

        this.x = x;
        this.y = y;
        this.xsee = xsee;
        this.ysee = ysee;

        this.type = Math.random() * 1.05 | 0;

        this.move = function() {

            if (this.x > 315) {
                this.x = 315;
                this.xsee = -this.xsee;
            } else if (this.x < 5) {
                this.x = 5;
                this.xsee = -this.xsee;
            }

            if (this.y > 315) {
                this.y = 315;
                this.ysee = -this.ysee;
            } else if (this.y < 5) {
                this.y = 5;
                this.ysee = -this.ysee;
            }

            this.x += this.xsee;
            this.y += this.ysee;

            if (this.type === 0) {
                ctx.fillStyle = currentColor;
            } else {
                ctx.fillStyle = '#fff';
            }

            ctx.beginPath();
            ctx.arc(this.x, this.y, 5, 0, pi2, true);
            ctx.closePath();
            ctx.fill();
        };
    }

    function createBall() {

        var x, y;

        do {
            x = Math.random() * 315;
            y = Math.random() * 315;
        } while (prey.x <= x + 35 && x <= prey.x + 55 && prey.y <= y + 35 && y <= prey.y + 55);

        balls.push(new Ball(x, y, Math.random() * 5.5 - 2.75, Math.random() * 5.5 - 2.75));
    }


    ctx = $('canvas').getContext('2d');
    window.setInterval(clock, 1000 / 60);


    function clock() {

        // global clear is faster for many balls
        ctx.clearRect(0, 0, 320, 320);

        ctx.fillStyle = "#c00";
        ctx.fillRect(prey.x, prey.y, 20, 20);


        ctx.fillStyle = "#c00";
        ctx.beginPath();
        ctx.arc(mouse.x, mouse.y, 10, 0, pi2, true);
        ctx.closePath();
        ctx.fill();


        if (activeDecay !== -1) {

            var now = Date.now();
            var pct = (now - activeDecay) / 3000;

            if (pct >= 1) {
                activeDecay = -1;
                pct = 1;
            }

            currentColor = 'rgba(51,51,51,'+(1 - 2 * pct)*(1 - 2 * pct)+')';
        }


        for (var i = 0; i < balls.length; i++) {

            balls[i].move();

            if (
                balls[i].x <= mouse.x + 15 && mouse.x <= balls[i].x + 15 &&
                balls[i].y <= mouse.y + 15 && mouse.y <= balls[i].y + 15 &&
                ((mouse.x - balls[i].x) * (mouse.x - balls[i].x) + (mouse.y - balls[i].y) * (mouse.y - balls[i].y)) <= 225) {

                if (balls[i].type === 0) {

                    balls = new Array();

                    if (maxScore < score) {
                        maxScore = score;
                    }

                    score = 0;
                    tries++;

                    updateStat();

                    activeDecay = -1;
                    currentColor = '#333';
                } else {
                    activeDecay = Date.now();
                }
            }
        }
    }

    document.onclick = function(ev) {

        var x = ev.pageX;
        var y = ev.pageY;

        for (var i = 0; i < balls.length; i++) {

            var t = balls[i];
            var d = ((t.x - x) * (t.x - x) + (t.y - y) * (t.y - y));

            t.xsee += (t.x - x) / d * 180;
            t.ysee += (t.y - y) / d * 180;
        }
    };

    document.ontouchstart = function(e) {

    };

    document.ontouchmove = document.onmousemove = function(e) {

        e.preventDefault();

        mouse.x = e.pageX;
        mouse.y = e.pageY;

        ctx.fillStyle = "#c00";
        ctx.beginPath();
        ctx.arc(mouse.x, mouse.y, 10, 0, pi2, true);
        ctx.closePath();
        ctx.fill();

        /////////////

        if (prey.x <= mouse.x + 10 && mouse.x <= prey.x + 30 && prey.y <= mouse.y + 10 && mouse.y <= prey.y + 30) {
            prey = {x: Math.random() * 300, y: Math.random() * 300};
            createBall();

            var now = Date.now();

            score+= Math.round(Math.max(5, 30 * Math.exp((now - lastCatch) * 0.000089)) * (activeDecay === -1 ? 1 : 2));

            lastCatch = now;
            updateStat();
        }
    };

})(this);