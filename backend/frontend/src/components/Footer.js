import React from 'react'
import { Container , Row , Col,Nav } from 'react-bootstrap'
import { LinkContainer } from 'react-router-bootstrap'

function Footer() {
    return (
            <footer style={{background:'#343a40'}}>
                 <Container>
                     <Row>
                     <Col className="py-3" style={{color:'white'}} md={6}>
                           Welcome to my website , You can find me in : <a href="https://github.com/hichamob" style={{color:'white'}}><i className="fab fa-github"> github</i></a>
                    </Col>
                    <Col className="text-center py-3" style={{color:'white'}}>
                           Copyright &copy; tee_codeshop
                    </Col>
                     </Row>
               </Container>
                     
        </footer>
              
    )
}

export default Footer
