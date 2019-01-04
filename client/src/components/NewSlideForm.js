import React from 'react';

const NewSlideForm = ({onNewSlide = f => f}) => {
    let start_time, title, notes, image_id
    const submit = e => {
        e.preventDefault()
        onNewSlide(start_time.value, title.value, notes.value, image_id.value)
        start_time.value = '0'
        image_id.value = ''
        title.value = ''
        notes.value = ''
        title.focus()
    }

    return (
        <form onSubmit={submit}>
            <input  ref={input => start_time = input}
                    type="text"
                    placeholder="Start time (seconds)" required />
            <input  ref={input => image_id = input}
                    type="text"
                    placeholder="Image ID" required />
            <input  ref={input => title = input}
                    type="text"
                    placeholder="Title..." required />
            <input  ref={input => notes = input}
                    type="text"
                    placeholder="Notes..." />
            <button>Add Slide</button>
        </form>
    )
}

export default NewSlideForm;