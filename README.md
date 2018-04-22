# Hackathon

Мы представляем в своем гитхабе прототип разработки первой стадии нашего проекта. К вашему вниманию мы представляем плагин для MetaTrader 4, который считывает торговые данные о трейдере (исторические и в онлайн режиме) и представляет их на http://hackathon.ftf.fund в виде таблицы и графика. Исторические данные отмечаются как недостоверные, данные после установки плагина считаются достоверными.

Вторая часть представляет собой бд (к сожалению развернутую исключительно локально из-за отсуствия подходящего сервера), для примера в нее производится инсерт из простейшего js файла), считается хэш от инсерта и с помощью простейшего смарт-контракта отправляется в эфирную сеть (для упрощения была взята тестовая сеть Rinkeby).

* Папка site - исходники сайта hackathon.ftf.fund
* Папка Smart contract - смарт контракт и js файл, связывающий контракт и бд
* TraderPlugin.mq4 - плагин трейдера для MT4

Дополнительные идея для улучшения сервиса:
- Система контроля рисков ([Реализация у конкурентов](https://ru.zulutrade.com/autoprotect-your-account), [подробнее](https://ru.zulutrade.com/zuluguard-guide))
