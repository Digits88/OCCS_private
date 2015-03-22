'use strict';
angular.module('app').filter('ISODateReviver', function () {
    return function (input) {
        if (input === null || input === undefined)
            return "";
        var a = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)(?:([\+-])(\d{2})\:(\d{2}))?Z?$/.exec(input);
        if (a) {
            var utcMilliseconds = Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4], +a[5], +a[6]);
            return new Date(utcMilliseconds).toLocaleDateString();
        }
        return input;
    }
});