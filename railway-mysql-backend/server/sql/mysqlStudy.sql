CREATE TABLE IF NOT EXISTS userInfo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    register_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nickname VARCHAR(50) NOT NULL,
    bet BIGINT NOT NULL DEFAULT 0,
    recharge BIGINT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS userInfoDay (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    data DATE NOT NULL,
    bet BIGINT NOT NULL DEFAULT 0,
    recharge BIGINT NOT NULL DEFAULT 0
)

INSERT INTO
    userInfo (nickname, bet, recharge)
VALUES ('用户1', DEFAULT, DEFAULT),
    ('用户2', DEFAULT, DEFAULT),
    ('用户3', DEFAULT, DEFAULT),
    ('用户4', DEFAULT, DEFAULT),
    ('用户5', DEFAULT, DEFAULT);

INSERT INTO
    userInfoDay (userId, data, bet, recharge)
VALUES (1, '2025-07-29', 100, 1000);

ALTER TABLE userInfoDay ADD Withdraw BIGINT NOT NULL DEFAULT 0;

UPDATE userInfoDay
SET
    Withdraw = 100
WHERE
    userId = 1
    AND data = '2025-07-29';

DELETE FROM userInfo WHERE id = 5;

ALTER TABLE userInfo ADD Withdraw BIGINT NOT NULL DEFAULT 0

CREATE TABLE IF NOT EXISTS messages1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    author VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE messages1;

SELECT id, register_time, nickname, bet, recharge FROM userInfo;

UPDATE userInfo SET nickname = '用户1' WHERE id = 4;

SELECT DISTINCT nickname FROM userInfo;

SELECT * FROM userInfo WHERE nickname LIKE '用%' ORDER BY id DESC

SELECT *
FROM userInfo
    INNER JOIN userInfoDay ON userInfo.id = userInfoDay.id
    --不去重，以ID为首列进行合并查询

SELECT bet
FROM userInfo
UNION
SELECT bet
FROM userInfoDay
    -- 去重，合并查询

UPDATE userInfoDay SET bet = 200 WHERE id =

INSERT INTO
    userInfoDay (
        id,
        userId,
        data,
        bet,
        recharge,
        Withdraw
    )
VALUES (
        2,
        2,
        '2025-07-29',
        200,
        500,
        100
    );

SELECT *
FROM userInfo mm
    RIGHT JOIN userInfoDay nn ON mm.id = nn.id
    -- 左右连接不去重   左连接，以左表为基准，左边不动(保留），右表完整连过来。右连接同理

CREATE TABLE IF NOT EXISTS gameRcord (
    userId INT(11) NOT NULL,
    inviteId INT(11),
    gameType VARCHAR(4) NOT NULL DEFAULT '电子',
    betAmount INT(10) NOT NULL DEFAULT 0,
    validBetAmount INT(10) NOT NULL DEFAULT 0,
    countValidBetWay VARCHAR(4) NOT NULL DEFAULT '按投注',
    betDay DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS commission (
    userId INT(11) NOT NULL,
    inviteId INT(11),
    subBet INT(10) NOT NULL DEFAULT 0,
    teamBet INT(10) NOT NULL DEFAULT 0,
    totalBet INT(10) NOT NULL DEFAULT 0,
    subCommission INT(10) NOT NULL DEFAULT 0,
    teamCommission INT(10) NOT NULL DEFAULT 0,
    totalCommission INT(10) NOT NULL DEFAULT 0,
    checkTime DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE gameRcord;

INSERT INTO
    gameRcord (
        userId,
        inviteId,
        gameType,
        betAmount,
        validBetAmount,
        countValidBetWay
    )
VALUES (
        18388733,
        NULL,
        DEFAULT,
        DEFAULT,
        DEFAULT,
        '按投注'
    ),
    (
        183976733,
        18388733,
        DEFAULT,
        DEFAULT,
        DEFAULT,
        '按投注'
    ),
    (
        183123133,
        18388733,
        DEFAULT,
        DEFAULT,
        DEFAULT,
        '按投注'
    ),
    (
        18388733,
        183123133,
        DEFAULT,
        DEFAULT,
        DEFAULT,
        '按投注'
    ),
    (
        2283948,
        183976733,
        DEFAULT,
        DEFAULT,
        DEFAULT,
        '按投注'
    );

DELIMITER / /

CREATE TRIGGER before_insert_gameRecord
BEFORE INSERT ON gameRecord
FOR EACH ROW
BEGIN
  SET NEW.validBetAmount = NEW.betAmount;
END;
//

CREATE TRIGGER before_insert_gameRecord
BEFORE INSERT ON gameRecord
FOR EACH ROW
BEGIN
  SET NEW.validBetAmount = NEW.betAmount;
END;

CREATE TRIGGER before_update_gameRecord
BEFORE UPDATE ON gameRecord
FOR EACH ROW
BEGIN
  SET NEW.validBetAmount = NEW.betAmount;
END ;

UPDATE gameRecord
SET
    betAmount = betAmount + 10
WHERE
    userId = 2283948;

INSERT INTO
    gameRecord (
        userId,
        inviteId,
        gameType,
        betAmount,
        validBetAmount,
        countValidBetWay
    )
VALUES (
        987747422,
        2283948,
        DEFAULT,
        DEFAULT,
        DEFAULT,
        '按投注'
    )

DROP TRIGGER IF EXISTS before_insert_gameRecord;

INSERT INTO
    gameRecord (
        userId,
        inviteId,
        gameType,
        betAmount,
        countValidBetWay
    )
VALUES (
        987747422,
        2283948,
        DEFAULT,
        20,
        '按投注'
    )

CREATE TRIGGER before_update_commission
BEFORE UPDATE ON commission
FOR EACH ROW
BEGIN
  SET NEW.totalBet = NEW.subBet + NEW.teamBet;
END ;