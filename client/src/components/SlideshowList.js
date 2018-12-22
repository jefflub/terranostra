import React, { Component } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

class SlideshowList extends Component {
    constructor(props){
        super(props)
        this.state = {
            slideshows: []
        }
    }
    componentDidMount() {
        axios.get('/api/v1/slideshows.json')
        .then(response => {
            console.log(response)
            this.setState({
                slideshows: response.data
            })
        })
        .catch(error => console.log(error))
    }

    render() {
        return(
            <div className="SlideshowList-container">
               {this.state.slideshows.map( slideshow => {
                    return (
                        <div className="single-slideshow" key={slideshow.id}>
                            <h4>{slideshow.title} (<Link to={`/slideshow/${slideshow.id}`}>Show</Link>) (<Link to={`/edit_slideshow/${slideshow.id}`}>Edit</Link>)</h4>
                            <audio className="theme-audio" src={slideshow.audio_url} type="audio/mp3" controls></audio>
                        </div>
                    )
                })}            
            </div>
        )
    }
}

export default SlideshowList;