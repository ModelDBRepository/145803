function  [tt1 vv1 ] = eqdifferentielleR(tt,aa,bb,condinitiale)

                      % method for exact solution
                                 vv(1) = condinitiale;
                           for n=2 :length(tt)
                               dtt = tt(n)-tt(n-1);
                                y = bb(n)/aa(n);
                                x = exp(aa(n)*dtt);
                                
                                vv(n) = vv(n-1)*x -y*(1-x);
                                
                           end
                           
                           
                           tt1=tt; vv1=vv;