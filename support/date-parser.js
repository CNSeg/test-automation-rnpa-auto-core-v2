function parseDate({format, moment}) {
    var date = new Date(Date.now());
    
    switch (moment){
        case "Amanhã":
            date.setDate(date.getDate() + 1);
            break;
        case "Ontem":
            date.setDate(date.getDate() - 1);
            break;
        default:
            date = date;
    }

    const year = date.getFullYear();
    const month = date.getMonth() + 1; // Month starts from 0 (Jan = 0)
    const day = date.getDate();
    const hour = date.getHours();
    const minute = date.getMinutes();

    var formatedDate;

    switch (format) {
        case "YYYY-MM-DD":
            formatedDate = `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}`;
            break;

        default:
            formatedDate = date;
    }

    return formatedDate;
}

module.exports = {parseDate};