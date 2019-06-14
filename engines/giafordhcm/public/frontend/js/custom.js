function uniqueId() {
    return 'id-xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

function applyJs(container) {
    //container.find('.select2').select2();
    
    if (container.find('.select2').length > 0) {

        $('.select2').selectpicker({
          style: 'ui-select',
          styleBase: '',
          size: "auto",
          "data-live-search": "true"
        });
    }
}