import React, { Component } from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

class SlideshowEdit extends Component {
    constructor(props) {
        super(props);
        this.state = {
            slideshow: null
        }
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
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Start Time</th>
                                <th>Notes</th>
                            </tr>
                            {this.state.slideshow.slides.map( slide => {
                                    return (
                                        <tr>
                                            <td>{slide.id}</td>
                                            <td>{slide.slide_type}</td>
                                            <td>{slide.image_id}</td>
                                            <td>{slide.title}</td>
                                            <td>{secondsToTimecode(slide.start_time)}</td>
                                            <td>{slide.notes}</td>
                                        </tr>
                                    )
                                })}  
                        </table>
                    </div>
                </div>
            );
        }
    }
}

export default SlideshowEdit;