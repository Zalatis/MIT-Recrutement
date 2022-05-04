$(document).ready(function() {
    $('#addClientForm').hide();

    $('#addClientBtn').on('click', function(){
        $('#addClientForm').slideDown();
    });

    $('#cancelBtn').on('click', function(){
        $('#addClientForm').slideUp();
    });

    const tbody = document.querySelector('tbody');
    const ths = document.querySelectorAll('th');
    const trs = tbody.querySelectorAll('tr');

    const compare = function(ids, asc){
        return function(row1, row2){
            const tdValue = function(row, ids){
                return row.children[ids].textContent;
            }
            const tri = function(v1, v2){
                if (v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2)){
                   return v1 - v2;
                }
                else {
                   return v1.toString().localeCompare(v2);
                }
            };
            return tri(tdValue(asc ? row1 : row2, ids), tdValue(asc ? row2 : row1, ids));
        }
    };

    ths.forEach(th => th.addEventListener('click', () =>{
        let classe = Array.from(trs).sort(compare(Array.from(ths).indexOf(th), this.asc = !this.asc));
        classe.forEach(tr => tbody.appendChild(tr));
    }));

    $('th').on('click', function(){
        console.log(this.asc);
        if(this.asc){
            
            $(this).find('i').removeClass('fa-sort-up');
            $(this).find('i').addClass('fa-sort-down');
        } else {
            $(this).find('i').removeClass('fa-sort-down');
            $(this).find('i').addClass('fa-sort-up');
        }
    });
});