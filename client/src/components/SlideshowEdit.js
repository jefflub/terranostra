import React, { Component } from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';
import NewSlideForm from './NewSlideForm';

class SlideshowEdit extends Component {
    constructor(props) {
        super(props);
        this.state = {
            slideshow: null
        }
        this.addNewSlide = this.addNewSlide.bind(this);
        this.removeSlide = this.removeSlide.bind(this);
    }

    addNewSlide(start_time, title, notes, image_id) {
        axios.post(`/api/v1/slideshows/${this.state.slideshow.id}/slides`, {slide: {image_id: image_id, start_time: start_time, title: title, notes: notes}})
        .then(response => {
            console.log(response)
            this.setState({slideshow: response.data})
        })
        .catch(error => {
            console.log(error)
        })
    }

    removeSlide(id) {
        axios.delete( '/api/v1/slides/' + id )
        .then(response => {
            const slides = this.state.slideshow.slides.filter(
                slide => slide.id !== id
            )
            const slideshow = this.state.slideshow
            slideshow.slides = slides
            this.setState({slideshow})
        })
        .catch(error => console.log(error))
    }

    componentDidMount() {
        const { id } = this.props.match.params

        axios.get(`/api/v1/slideshows/${id}`)
        .then(response => {
            console.log(response)
            this.setState({
                slideshow: response.data
            })
            document.startTimesheets();
        })
        .catch(error => console.log(error))
    }

    render() {
        function secondsToTimecode(seconds) {
            return `${Math.floor(seconds / 60)}:${(seconds % 60).toString().padStart(2,0)}`
        }

        if (this.state.slideshow == null) {
            return( <h1>Loading</h1> )
        } else {
            return(
                <div>
                    <h2>{this.state.slideshow.title} ({secondsToTimecode(this.state.slideshow.duration)})</h2>
                    <Link to="/">Home</Link>
                    <div>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Type</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Start Time</th>
                                    <th>Notes</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.state.slideshow.slides.map( slide => {
                                        return (
                                            <tr key={slide.id}>
                                                <td>{slide.id}</td>
                                                <td>{slide.slide_type}</td>
                                                <td>{slide.image_id}</td>
                                                <td>{slide.title}</td>
                                                <td>{secondsToTimecode(slide.start_time)}</td>
                                                <td>{slide.notes}</td>
                                                <td><button onClick={() => this.removeSlide(slide.id)}>Delete</button></td>
                                            </tr>
                                        )
                                    })}  
                            </tbody>
                        </table>
                    </div>
                    <div><NewSlideForm onNewSlide={this.addNewSlide} /></div>
                </div>
            );
        }
    }
}

export default SlideshowEdit;