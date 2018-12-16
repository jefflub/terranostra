import React, { Component } from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

class Slideshow extends Component {
    constructor(props){
        super(props)
        this.state = {
            slideshow: null
        }
    }
    componentDidMount() {
        axios.get('/api/v1/slideshows/2')
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
                    <h2>{this.state.slideshow.title}</h2>
                    <Link to="/">Home</Link>
                    <div>
                    <div id="slideshow"
                        data-timecontainer = "excl"
                        data-timeaction    = "intrinsic"
                        data-mediasync     = "#music"
                        data-controls      = "#timeController"
                        data-navigation    = "arrows; click; hash"
                        data-dur           = {secondsToTimecode(this.state.slideshow.duration)}>

                        {this.state.slideshow.slides.map( slide => {
                            return (
                                <div id={'slide' + slide.id} key={slide.id} data-begin={secondsToTimecode(slide.start_time)}>
                                    <img src={'/' + slide.image.url} alt="foo"/>
                                </div>    
                            )
                        })}  
                    </div>  
                    <audio id="music" autoPlay src={'/' + this.state.slideshow.audio_url} type="audio/mp3"></audio>   
                    <nav id="timeController" className="smil-timeController">
                        <div className="smil-toc" style={{display: 'none'}}>
                        <ul className="smil-tocList">
                            {this.state.slideshow.slides.map( slide => {
                                return (
                                    <li><a href={'#slide' + slide.id}>{slide.notes}</a></li>
                                )
                            })}
                        </ul>
                        </div>

                        <div className="smil-controlBar">
                        <div className="smil-left">
                            <button className="smil-first"><span>|«</span></button>
                            <button className="smil-prev"><span>«</span></button>
                            <button className="smil-play"><span>▶||</span></button>
                            <button className="smil-next"><span>»</span></button>
                            <button className="smil-last"><span>»|</span></button>
                        </div>
                        <div className="smil-timeline">
                            <div className="smil-timeSlider"></div>
                            <div className="smil-timeSegments"></div>
                            <div className="smil-timeCursor"></div>
                        </div>
                        <div className="smil-right smil-currentTime">00:00</div>
                        </div>
                        <div className="smil-tocDisplay"></div>
                    </nav>     
                    </div>
                </div>
            )
        }
    }
}

export default Slideshow;