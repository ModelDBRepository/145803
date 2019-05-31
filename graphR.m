


function     [g] = graphR(GGG)


%%
g= GGG.g ;


switch  g % type of graphics
    

%% 1  voltage vs time        
            case{1}
        
            figure(1)
          
            set(gcf,'Color',[1,1,1])
            hold off
                     plot(GGG.tt,GGG.vv,'DisplayName','Tension normal vs time ','LineWidth',3,'color','r')
             hold on                 
                    plot(GGG.tta,GGG.vva,'DisplayName','Tension in oversampling vs time','LineWidth',2,'color','k')           
             hold off
           xlabel('time (s)','FontSize',18,'color','k')
           ylabel(' Tension (mV)','FontSize',18,'color','k')
           title('Tension vs time','FontSize',18,'color','k')
           box on
           xlim([0.001 max(GGG.tt)])       

%% 2 preconductances

    case{2}
               
          
            figure(2)

            set(gcf,'Color',[1,1,1])
            hold off
            plot(GGG.tt,GGG.ggs1,'DisplayName','g_{\alpha} vs time original ','LineWidth',3,'color','r')
           hold on
           plot(GGG.tt,GGG.ggs2,'DisplayName', 'g_{\beta} vs time original ','LineWidth',3,'color','r')
           plot(GGG.ttEx,GGG.ggs2Ex,'DisplayName','g_{\beta} vs time (extraction)','LineWidth',2,'color','k')
            plot(GGG.ttEx,GGG.ggs1Ex,'DisplayName','g_{\alpha} vs time (extraction) ','LineWidth',2,'color','k')                
           hold off
           xlabel('time (s)','FontSize',18,'color','k')
           ylabel(' Preconductances','FontSize',18,'color','k')
           title('Extraction of  preconductances vs time','FontSize',18,'color','k')
           box on
           xlim([0.001 max(GGG.tt)])
      
           
%% 3  conductances       
    case{3}      
        
          
                 figure(3)
          
                set(gcf,'Color',[1,1,1])
                hold off
                plot(GGG.tt,GGG.gge,'DisplayName','g_e vs time ','LineWidth',3,'color','r')
               hold on        
                plot(GGG.tt,GGG.ggi,'DisplayName','g_i vs time ','LineWidth',3,'color','r')
                plot(GGG.ttEx,GGG.ggiEx,'DisplayName','g_i vs time (extraction)','LineWidth',2,'color','k')
                plot(GGG.ttEx,GGG.ggeEx,'DisplayName','g_e vs time (extraction)','LineWidth',2,'color','k')
               hold off
               xlabel('time (s)','FontSize',18,'color','k')
               ylabel(' Conductances(S)','FontSize',18,'color','k')
               box on
                xlim([0.001 max(GGG.tt)])
                 title('Extraction of  conductances vs time','FontSize',18,'color','k')

%% 4 preconductances singularites
  case{4}          
                                            
            figure(4)

            set(gcf,'Color',[1,1,1])
            hold off
                           plot(GGG.ttEx,GGG.ggs1ExSing,'DisplayName','g_{\alpha} vs time (singularities)','color','r')
           hold on
                           plot(GGG.ttEx,GGG.ggs2ExSing,'DisplayName', 'g_{\beta} vs time (singularities) ','color','r')
                           plot(GGG.ttEx,GGG.ggs2Ex,'DisplayName','g_{\beta}  vs time  (extraction)','LineWidth',2,'color','k')
                           plot(GGG.ttEx,GGG.ggs1Ex,'DisplayName','g_{\alpha} vs time  (extraction) ','LineWidth',2,'color','k')

                 
           hold off
           xlabel('time (s)','FontSize',18,'color','k')
           ylabel(' Preconductances','FontSize',18,'color','k')
           title('Extraction of preconductances in time and singularities ','FontSize',18,'color','k')
           box on
           xlim([mean(GGG.ttEx) mean(GGG.ttEx)+0.05])
           
           
%%

end
