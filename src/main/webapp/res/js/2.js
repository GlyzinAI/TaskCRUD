function youSure(id) {

    Swal.fire({
        title: 'Вы уверены?',
        text: "Вы собираетесь удалить запись. Восстановление невозможно. Продолжить?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete!'

    }).then((result) => {
        if (result.value) {
        Swal.fire(
            'Удалено!',
            'Запись была удалена.',
            'success'
        )

        document.location.href ="/delete/" + id
    }
})}