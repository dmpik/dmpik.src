function copyLink(id) {
    var elem = document.createElement("textarea");
    document.body.appendChild(elem);
    elem.value = location.protocol+'//'+ location.host+ location.pathname+ "#" + id;
    elem.select();
    document.execCommand("copy");
    document.body.removeChild(elem);
}

